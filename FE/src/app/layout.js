'use client';
import { useEffect } from 'react';
import { Providers } from '@/store/provider';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import ChatBot from '@/components/chatbot';
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import "@/styles/style.scss";
import "@/components/chatbot/style.scss";
import 'react-chatbot-kit/build/main.css';

const RootLayout = ({ children }) => {

	useEffect(() => {
		window.bootstrap = require("bootstrap/dist/js/bootstrap.bundle.min.js");
	}, []);
	const queryClient = new QueryClient();

	return (
		<html lang="en">
			<head>
				<link rel="stylesheet" href="/css/font-awesome.css" />
				<link rel="preconnect" href="https://fonts.googleapis.com" />
				<link rel="preconnect" href="https://fonts.gstatic.com" />
				<link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400&display=swap" rel="stylesheet" />
			</head>
			<body>

				<QueryClientProvider client={queryClient} >
					<Providers>
						{children}
						<div style={{ position: 'fixed', bottom: '20px', right: '20px', zIndex: '999' }}>
							<ChatBot />
						</div>
					</Providers>
				</QueryClientProvider>
			</body>
		</html>
	);
}

export default RootLayout;

