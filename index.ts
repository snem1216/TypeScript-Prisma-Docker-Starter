import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

function testMessage(subject: string = "world"): string {
  return `Hello, ${subject}! `;
}

async function dbTestMessages() {
  const res = await prisma.user.findMany();
  res.forEach(row=> {
    console.log(testMessage(row.name));
  });
}

console.log(testMessage());
dbTestMessages().then();
