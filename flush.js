import fs from 'node:fs/promises'
import path from 'node:path'
import { fileURLToPath } from 'url'
const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

const directory = path.resolve(__dirname,'../AI/embeddings')

for (const file of await fs.readdir(directory)) {
  await fs.unlink(path.join(directory, file))
  //console.log(path.join(directory, file))
}
console.log('Embeddings Deleted Successfully.')
