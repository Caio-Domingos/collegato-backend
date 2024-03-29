import { NextFunction, Response } from 'express';
import { verify } from 'jsonwebtoken';
import { SECRET_KEY } from '@config';
import { UsuarioEntity } from '@entities/usuario.entity';
import { HttpException } from '@exceptions/HttpException';
import { DataStoredInToken, RequestWithUser } from '@interfaces/auth.interface';

const authMiddleware = async (req: RequestWithUser, res: Response, next: NextFunction) => {
  try {
    const Authorization = req.cookies['Authorization'] || (req.header('Authorization') ? req.header('Authorization').split('Bearer ')[1] : null);
    if (Authorization) {
      const secretKey: string = SECRET_KEY;

      const { id } = (await verify(Authorization, secretKey)) as DataStoredInToken;
      console.log('id', id);
      const findUser = await UsuarioEntity.findOne(id, { select: ['id', 'login', 'senha'] });

      if (findUser) {
        req.user = findUser;
        next();
      } else {
        next(new HttpException(401, 'Wrong authentication token'));
      }
    } else {
      next(new HttpException(404, 'Authentication token missing'));
    }
  } catch (error) {
    console.log('error', error);
    next(new HttpException(401, 'Wrong authentication token'));
  }
};

export default authMiddleware;
