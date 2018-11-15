import Vue from 'vue'
import VueRouter from 'vue-router'


Vue.use(VueRouter)

//view router
const user = () => import('@/views/User')
const home = () => import('@/views/Home')
const Explore = () => import('@/views/Explore')
const forum = () => import('@/views/Forum')
const study = () => import('@/views/Study')



//user router
const userdata = () => import('@/components/UserData')
const mynews = () => import('@/components/MyNews')
const mycreations = () => import('@/components/MyCreations')
const myfavorites = () => import('@/components/MyFavorites')
const myfocus = () => import('@/components/MyFocus')
const myachievement = () => import('@/components/MyAchievement')
const mypost = () => import('@/components/MyPost')
const myarticle = () => import('@/components/MyArticle')
const my_fav_photos = () => import('@/components/My-Fav-Photos')
const my_fav_posts = () => import('@/components/My-Fav-Posts')
const my_fav_articles = () => import('@/components/FavArticles')





//centre router
const shop = () => import('@/components/Shop')
const about = () => import('@/components/About')
const group = () => import('@/components/Group')
const suggestions = () => import('@/components/Suggestions')
const settings = () => import('@/components/Settings')
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
        path: '/study',
        name: 'study',
        component: study
    },
    {
        path: '/Explore',
        name: 'Explore',
        component: Explore
    },
    {
        path: '/forum',
        name: 'forum',
        component: forum
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