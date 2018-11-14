import Vue from 'vue'
import VueRouter from 'vue-router'


Vue.use(VueRouter)

//view router
const user = () => import('@/views/User')
const home = () => import('@/views/Home')
const Explore = () => import('@/views/Explore')
const envision = () => import('@/views/Envision')
const study = () => import('@/views/Study')
const forum = () => import('@/views/Forum')


//user router
const userdata = () => import('@/components/userdata')
const mynews = () => import('@/components/mynews')
const mycreations = () => import('@/components/mycreations')
const myfavorites = () => import('@/components/myfavorites')
const myfocus = () => import('@/components/myfocus')
const myachievement = () => import('@/components/myachievement')
const mypost = () => import('@/components/mypost')
const myarticle = () => import('@/components/myarticle')
const my_fav_photos = () => import('@/components/my-fav-photos')
const my_fav_posts = () => import('@/components/my-fav-posts')
const my_fav_articles = () => import('@/components/FavArticles')


//centre router
const shop = () => import('@/components/shop')
const about = () => import('@/components/About')
const group = () => import('@/components/group')
const suggestions = () => import('@/components/suggestions')
const settings = () => import('@/components/settings')
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
		path: '/Explore',
		name: 'Explore',
		component: Explore
	},
	{
		path: '/envision',
		name: 'envision',
		component: envision
	},
	{
		path: '/study',
		name: 'study',
		component: study
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