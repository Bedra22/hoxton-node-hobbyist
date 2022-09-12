import express from 'express'
import cors from 'cors'
import { PrismaClient } from '@prisma/client'

const app = express()
const port = 5000
app.use(express.json())
app.use(cors())
const prisma = new PrismaClient({ log: ['warn', 'error', 'info', 'query'] })

//users CRUD

app.get('/users', async (req, res) => {
    const user = await prisma.users.findMany({ include: { Hoobies: true } })
    res.send(user)
})

app.post('/users', async (req, res) => {
    const newUser = await prisma.users.create({ data: req.body, include: { Hoobies: true } })
    res.send(newUser)
})

app.patch('/users/:id', async (req, res) => {
    const id = Number(req.params.id)
    const updateUser = await prisma.users.update({ data: req.body, where: { id }, include: { Hoobies: true } })
    res.send(updateUser)
})

app.delete('/users/:id', async (req, res) => {
    const id = Number(req.params.id)
    const deleteUser = await prisma.users.delete({ where: { id } })
    res.send(deleteUser)
})

//hobbies CRUD

app.get('/hoobies', async (req, res) => {
    const hoobies = await prisma.hoobies.findMany({ include: { user: true } })
    res.send(hoobies)
})

app.post('/hoobies', async (req, res) => {
    const newHooby = await prisma.hoobies.create({ data: req.body, include: { user: true } })
    res.send(newHooby)
})

app.patch('/hoobies/:id', async (req, res) => {
    const id = Number(req.params.id)
    const updateHobbies = await prisma.hoobies.update({ data: req.body, where: { id }, include: { user: true } })
    res.send(updateHobbies)
})

app.delete('/hoobies/:id', async (req, res) => {
    const id = Number(req.params.id)
    const deleteHobby = await prisma.hoobies.delete({ where: { id } })
    res.send(deleteHobby)
})

app.listen(port, () => {
    console.log(`We are running on http://localhost:${port}`)

})