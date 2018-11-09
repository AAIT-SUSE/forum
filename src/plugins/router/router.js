import Vue from 'vue'
import VueRouter from 'vue-router'


Vue.use(VueRouter)

//view router
const user = () => import('@/views/user/user')
const home = () => import('@/views/home/Home')
const forum = () => import('@/views/forum/forum')
const envision = () => import('@/views/envision/envision')


//user router
const userdata = () => import('@/views/user/components/userdata')
const mynews = () => import('@/views/user/components/mynews')
const mycreations = () => import('@/views/user/components/mycreations')
const myfavorites = () => import('@/views/user/components/myfavorites')
const myfocus = () => import('@/views/user/components/myfocus')
const myachievement = () => import('@/views/user/components/myachievement')
const mypost = () => import('@/views/user/components/mypost')
const myarticle = () => import('@/views/user/components/myarticle')
const my_fav_photos = () => import('@/views/user/components/my-fav-photos')
const my_fav_posts = () => import('@/views/user/components/my-fav-posts')
const my_fav_articles = () => import('@/views/user/components/my-fav-articles')





//centre router
const shop = () => import('@/views/user/components/centre/shop')
const about = () => import('@/views/user/components/centre/about')
const group = () => import('@/views/user/components/centre/group')
const suggestions = () => import('@/views/user/components/centre/suggestions')
const settings = () => import('@/views/user/components/centre/settings')
//home router


const routes = [{
        path: '/user',
        name: 'user',
        component: user,
    },

    {
        path: '/home',
        name: 'home',
        component: home
    },
    {
        path: '/forum',
        name: 'forum',
        component: forum
    },
    {
        path: '/envision',
        name: 'envision',
        component: envision
    },
    //user children router
    {
        path: '/userdata',
        name: 'userdata',
        component: userdata
    },
    {
        path: '/user/mynews',
        name: 'mynews',
        component: mynews
    },
    {
        path: '/user/mycreations',
        name: 'mycreations',
        component: mycreations
    },
    {
        path: '/user/myfavorites',
        name: 'myfavorites',
        component: myfavorites
    },
    {
        path: '/user/myfocus',
        name: 'myfocus',
        component: myfocus
    },
    {
        path: '/user/myachievement',
        name: 'myachievement',
        component: myachievement
    },
    {
        path: '/user/mycreations/mypost',
        name: 'mypost',
        component: mypost
    },
    {
        path: '/user/mycreations/myarticle',
        name: 'myarticle',
        component: myarticle
    },
    {
        path: '/user/myfavrites/my-fav-photos',
        name: 'my_fav_photos',
        component: my_fav_photos
    },
    {
        path: '/user/myfavrites/my-fav-posts',
        name: 'my_fav_posts',
        component: my_fav_posts
    },
    {
        path: '/user/myfavrites/my-fav-articles',
        name: 'my_fav_articles',
        component: my_fav_articles
    },
    //centre children router
    {
        path: '/centre/shop',
        name: 'shop',
        component: shop
    },
    {
        path: '/centre/about',
        name: 'about',
        component: about
    },
    {
        path: '/centre/group',
        name: 'group',
        component: group
    },
    {
        path: '/centre/suggestions',
        name: 'suggestions',
        component: suggestions
    },
    {
        path: '/centre/settings',
        name: 'settings',
        component: settings
    },
];




const router = new VueRouter({
    routes: routes
})


export default router