import { createChatBotMessage } from 'react-chatbot-kit';
import Markdown from 'react-markdown';
const config = {
    initialMessages: [createChatBotMessage(`Xin chào, tôi có thể giúp gì cho bạn?`)],
    customComponents: {
        // Replaces the default header
        header: () => <div style={{ backgroundColor: '#3478F0', padding: "5px", borderRadius: "3px", color: "white", textAlign: "center", height: "50px", alignContent: "center" }}>CSKH Nguyễn Đoàn</div>,

        botChatMessage: (props) => <div ><Markdown>{props.message}</Markdown></div>,

    },
    customStyles: {
        botMessageBox: {
            backgroundColor: "#376B7E",
        },
        chatButton: {
            backgroundColor: "#3478F0",
        },


    }
};

export default config;