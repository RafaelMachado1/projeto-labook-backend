import { UserDatabase } from "../database/UserDatabase";
import { HashManager } from "../services/HashManager";
import { TokenManager } from "../services/TokenManager";
import { IdGenerator } from "../services/idGenerator";

export class UserBusiness {
    constructor (
        private userDatabase: UserDatabase,
        private idGenerator: IdGenerator,
        private tokenManager: TokenManager,
        private hashManager: HashManager
    ) {}

    // endpoints
}