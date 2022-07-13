/** Import des modules */
import axios from 'axios'
import { accountService } from './account.service'
import router from '@/router'

/** Paramétrage d'axios */
const AxiosUser = axios.create( {
    baseURL: 'http://localhost:10000'
} )

const AxiosData = axios.create( {
    baseURL: 'http://localhost:10001'
} )

const AxiosCtn = axios.create( {
    baseURL: 'http://localhost:10002'
} )

/** Interceptor pour le token */
AxiosData.interceptors.request.use( request => {

    if ( accountService.isLogged() ) {
        request.headers.Authorization = 'Bearer ' + accountService.getToken()
    }

    return request
} )

export { AxiosUser, AxiosData, AxiosCtn }