import { $ } from "bun";
try {
  const response = await fetch("https://api.github.com/users/oovaa/repos");

  if (!response.ok) {
    // Handle HTTP errors manually
    const errorBody = await response.json();
    throw new Error(`HTTP ${response.status}: ${errorBody.message}`);
  }

  const data = await response.json();
  //   console.log(data); // This is your actual repo data

  for (const i in data) {
    const repo_data = data[i];
    const repo_url = repo_data.url;
    const reponame = repo_data.url.split("/").at(-1);
    const final_url = repo_url
      .replace("api.", "")
      .replace("repos/", "")
      .split("/");
    const size = repo_data.size;

    if (doesFolderExist(reponame)) {
      await $`echo no pull ${reponame}`;
      continue;
    }
    // --- Skip if repository is larger than the defined limit ---
    if (size > 1024) {
      console.log(
        `loh Skipping repo [${reponame}] due to size (${size} KB) > limit (1024 KB)`
      );
      continue; // Move to the next repository
    }

    console.log(`to pull ${reponame}`);

    await $`gh repo clone  ${final_url[3]}/${final_url[4]}`;
  }
} catch (error) {
  console.error("Fetch error:", error.message);
}

import { statSync } from "fs";
import { join } from "path";

/**
 * Checks if a folder with the given name exists in the current working directory.
 * @param folderName Name of the folder to check for.
 * @returns `true` if it exists and is a directory, otherwise `false`.
 */
function doesFolderExist(folderName) {
  const fullPath = join(process.cwd(), folderName);

  try {
    return statSync(fullPath).isDirectory();
  } catch {
    return false;
  }
}
