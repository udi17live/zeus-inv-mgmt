const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()

async function main() {
    const admin = await prisma.userType.upsert({
        where: { user_type_id: 1 },
        update: {},
        create: {
            user_type_id: 1,
            name: 'Admin',
        },
    })

    const manager = await prisma.userType.upsert({
        where: { user_type_id: 2 },
        update: {},
        create: {
            user_type_id: 2,
            name: 'Manager',
        },
    })
}
main()
    .then(async () => {
        await prisma.$disconnect()
    })
    .catch(async (e) => {
        console.error(e)
        await prisma.$disconnect()
        process.exit(1)
    })