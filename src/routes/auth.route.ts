import { Router } from 'express';
import AuthController from '@controllers/auth.controller';
import { UsuarioCreateDTO, UsuarioLoginDTO } from '@dtos/usuario.dto';
import { Routes } from '@interfaces/routes.interface';
import authMiddleware from '@middlewares/auth.middleware';
import validationMiddleware from '@middlewares/validation.middleware';

class AuthRoute implements Routes {
  public path = '/';
  public router = Router();
  public authController = new AuthController();

  constructor() {
    this.initializeRoutes();
  }

  private initializeRoutes() {
    this.router.post(`${this.path}signup`, validationMiddleware(UsuarioCreateDTO, 'body'), this.authController.signUp);
    this.router.post(`${this.path}login`, validationMiddleware(UsuarioLoginDTO, 'body'), this.authController.logIn);
    this.router.post(`${this.path}login/key`, this.authController.logInWithKey);
    this.router.post(`${this.path}verifyToken`, this.authController.verifyToken);
    this.router.post(`${this.path}forgotPassword`, this.authController.forgotPassword);
    this.router.post(`${this.path}resetPassword`, this.authController.resetPassword);
    this.router.post(`${this.path}logout`, authMiddleware, this.authController.logOut);
  }
}

export default AuthRoute;
