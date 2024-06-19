import Home from "./home/page";


export const metadata = {
	title: 'Laptop Nguyễn Đoàn',
	description: 'Laptop Nguyễn Đoàn',
	description: 'Laptop Nguyễn Đoàn',

}

const HomeOne = () => {
	console.log(process.env.NEXT_PUBLIC_APP_URL);
	return (
		<>
			<main className="main-wrapper pv-main-wrapper">
				<Home />
			
			</main>

		</>
	);
}

export default HomeOne;

