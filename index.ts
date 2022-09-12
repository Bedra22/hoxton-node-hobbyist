import express from 'express'
import cors from 'cors'
import { PrismaClient } from '@prisma/client'

const app = express()
const port = 5000
app.use(express.json())
app.use(cors())
const prisma = new PrismaClient({ log: ['warn', 'error', 'info', 'query'] })


app.get('/users', async (req, res) => {
    const user = await prisma.users.findMany({ include: { Hoobies: true } })
    res.send(user)
})

app.post('/users', async (req, res) => {
    const newUser = await prisma.users.create({ data: req.body, include: { Hoobies: true } })
    res.send(newUser)
})

app.get('/hoobies', async (req, res) => {
    const hoobies = await prisma.hoobies.findMany({ include: { user: true } })
    res.send(hoobies)
})

app.post('/hoobies', async (req, res) => {
    const newHooby = await prisma.hoobies.create({ data: req.body, include: { user: true } })
    res.send(newHooby)
})


app.listen(port, () => {
    console.log(`We are running on http://localhost:${port}`)

})