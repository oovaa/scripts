import dotenv from 'dotenv'
dotenv.config()
import path from 'path'
import {fileURLToPath} from 'url'
import {HNSWLib} from 'langchain/vectorstores/hnswlib'
import { OpenAIEmbeddings } from 'langchain/embeddings/openai'
import {LLMChain} from 'langchain/chains'
import { PromptTemplate } from 'langchain/prompts'
import createModel from '../AI/utils/model.js'
const model = createModel({temp: 0.6, type: 'llm'})

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)
const embedding = new OpenAIEmbeddings()
const embeddingsDir = '../AI/embeddings'
const vectorStore = await HNSWLib.load(path.resolve(__dirname, embeddingsDir), embedding)

const promptTemplate = `Use the query below and write me five variations from it.
# Query:
{query}
---
respond in valid json format
#Response format
"""
[
  <first variation>,
  <second variation>,
  ..
]
"""
# Answer:`

const prompt = new PromptTemplate({
  template: promptTemplate,
  inputVariables: ['query']
})
const chain = new LLMChain({
  llm: model,
  prompt
})
const query = 'ملخص احداث معركة كرري'
const llmRes = await chain.call({
  query
})
const variations = JSON.parse(llmRes.text)
console.log(variations)


let bestQuery = null
let max = 0
const prmss = variations.map(async query => {
  const response = await vectorStore.similaritySearchWithScore(query, 5)
  let res = 0
  response.forEach(doc => {
      res += Number(doc[1])
  })
  if (res > max) {
    bestQuery = query
  }
  max = res
})
await Promise.all(prmss)
console.log(bestQuery)

