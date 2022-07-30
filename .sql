-- Criando o Banco
CREATE DATABASE "banco_Sexta"

CREATE TABLE "customer"(
    "id" serial PRIMARY KEY,
    "fullName" TEXT NOT NULL,
    "cpf" VARCHAR(11) UNIQUE NOT NULL,
    "email" TEXT UNIQUE NOT NULL,
    "password" TEXT NOT NULL
);

CREATE TABLE "bankAccount"(
    "id" serial PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customer"("id"),
    "accountNumber" INTEGER NOT NULL,
    "agency" INTEGER NOT NULL,
    "openDate" DATE  NOT NULL,
    "closeDate" DATE NOT NULL
);

CREATE TABLE "transations"(
    "id" serial PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    "amount" INTEGER NOT NULL,
    "type" TEXT NOT NULL,
    "time" TIME NOT NULL,
    "description" TEXT,
    "canceled" BOOLEAN NOT NULL
);

CREATE TABLE "creditCard"(
    "id" serial PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    "fullName" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "securityCode" INTEGER NOT NULL,
    "expirationMonth"INTEGER NOT NULL,
    "expirationYear"INTEGER NOT NULL,
    "password" INTEGER NOT NULL,
    "limit" INTEGER NOT NULL
);

CREATE TABLE "customerAddress"(
    "id" serial PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customer"("id")UNIQUE,
    "street" TEXT NOT NULL,
    "number" INTEGER NOT NULL,
    "complement" TEXT NOT NULL,
    "postalCode" INTEGER NOT NULL,
    "cityId" INTEGER NOT NULL
);