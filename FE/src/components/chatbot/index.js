import Chatbot, { createChatBotMessage } from 'react-chatbot-kit';
import Markdown from 'react-markdown';
import MessageParser from './MessageParser';
import ActionProvider from './ActionProvider';
import { useState } from 'react';
import { FaRegMessage, FaXmark } from 'react-icons/fa6';
import './style.scss';

const ChatBot = () => {
    const [showBot, toggleBot] = useState(true);

    const header =
        <div style={{ backgroundColor: '#3478F0', padding: "10px", borderRadius: "3px", color: "white", display: "flex", justifyContent: "space-between", alignItems: "center" }}>
            <span>CSKH Nguyễn Đoàn</span>
            <div><FaXmark size={20} style={{ cursor: "pointer" }} onClick={() => toggleBot((prev) => !prev)} /></div>
        </div>

    const config = {
        initialMessages: [createChatBotMessage(`Xin chào, tôi có thể giúp gì cho bạn?`)],
        customComponents: {
            header: () => header,
            botChatMessage: (props) => <div ><Markdown>{props.message}</Markdown></div>,
            userChatMessage: (props) => <div ><Markdown>{props.message}</Markdown></div>,
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

    return (
        <div>
            {!showBot &&
                <Chatbot
                    placeholderText='Vui lòng nhập thắc mắc?'
                    config={config}
                    messageParser={MessageParser}
                    actionProvider={ActionProvider}
                />
            }
            {showBot &&
                <button className='btn btn-primary rounded-circle p-3' onClick={() => toggleBot((prev) => !prev)}>
                    <FaRegMessage style={{ fontSize: '30', color: 'white' }} />
                </button>
            }
        </div>
    )
}

export default ChatBot;