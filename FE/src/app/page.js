import HomeFashion from "./home/fashion/page";

export const metadata = {
	title: 'eTrade Multipurpose eCommerce Next JS Template',
	description: 'eTrade Multipurpose eCommerce Nextjs Template',
	description: 'eTrade Multipurpose eCommerce Nextjs Template',

}

const HomeOne = () => {
	console.log(process.env.NEXT_PUBLIC_APP_URL);
	return (
		<>
			<main className="main-wrapper pv-main-wrapper">
				<HomeFashion />
			
			</main>

		</>
	);
}

export default HomeOne;

