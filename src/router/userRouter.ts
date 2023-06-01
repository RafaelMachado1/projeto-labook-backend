import express from 'express'
import { UserController } from '../controller/UserController'
import { UserDTO } from '../dtos/UserDTO'
import { UserBusiness } from '../business/UserBusiness'
import { UserDatabase } from '../database/UserDatabase'
import { IdGenerator } from '../services/idGenerator'
import { TokenManager } from '../services/TokenManager'
import { HashManager } from '../services/HashManager'


export const userRouter = express.Router()

const userController = new UserController(
    new UserDTO(),
    new UserBusiness(
        new UserDTO(),
        new UserDatabase(),
        new IdGenerator(),
        new TokenManager(),
        new HashManager()
    )
)

userRouter.post("/signup", userController.signupUsers)
userRouter.post("/login", userController.loginUser)