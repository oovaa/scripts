import dotenv from 'dotenv'
dotenv.config()

import path from 'path'
import { fileURLToPath } from 'url'
import {RecursiveCharacterTextSplitter} from 'langchain/text_splitter'
import {OpenAIEmbeddings} from 'langchain/embeddings/openai'
import {TextLoader} from 'langchain/document_loaders/fs/text'
import { DirectoryLoader } from 'langchain/document_loaders/fs/directory'
import {HNSWLib} from 'langchain/vectorstores/hnswlib'
const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)



/* Name of directory to retrieve your files from
   Make sure to add your PDF files inside the 'docs' folder
*/
const DocsPath = 'docs'
const embeddingsDir = path.resolve(__dirname, '../AI/embeddings')

try {
  /*load raw docs from the all files in the directory */
  const directoryLoader = new DirectoryLoader(DocsPath, {
    '.txt': (path) => new TextLoader(path)
  })

  let rawDocs = await directoryLoader.load()
  rawDocs = rawDocs.map((doc) => {
    const docPathArr = doc.metadata.source.split('/')
    const subject = docPathArr[docPathArr.length - 1].split('.')[0]
    //doc.metadata.source = 'كتاب التاريخ للصف الثالث الثانوي'
    doc.metadata.subject = subject
    return doc
  })
  //console.log(rawDocs)
  /* Split text into chunks */
  const textSplitter = new RecursiveCharacterTextSplitter({
    chunkSize: 700,
    chunkOverlap: 0,
    separators: ['\n']
  })

  const docs = await textSplitter.splitDocuments(rawDocs)
  //console.log('split docs', docs)


  //console.log(docs)
  console.log('creating vector store...')

  /*create and store the embeddings in the vectorStore*/
    const embeddings = new OpenAIEmbeddings()

    const vectorStore =  await HNSWLib.fromDocuments(docs, embeddings)
    await vectorStore.save(embeddingsDir)

} catch (error) {
  console.log('error', error)
  throw new Error('Failed to ingest your data')
}


console.log('ingestion complete')
