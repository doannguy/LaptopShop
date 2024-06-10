import HomeFashion from "./home/fashion/page";
import Chatbot from 'react-chatbot-kit';
import 'react-chatbot-kit/build/main.css';

export const metadata = {
	title: 'eTrade Multipurpose eCommerce Next JS Template',
	description: 'eTrade Multipurpose eCommerce Nextjs Template',
	description: 'eTrade Multipurpose eCommerce Nextjs Template',

}

const HomeOne = () => {
	return (
		<>
			<main className="main-wrapper pv-main-wrapper">
				<HomeFashion />
			</main>

		</>
	);
}

export default HomeOne;

