// in MessageParser.js
import React from 'react';
import { postDataToGemini } from '@/services/gemini_api';

var text = "";
const MessageParser = ({ children, actions }) => {
    const parse = async (message) => {
        const response = await postDataToGemini({
            messenger: message
        });
        text = text + response;

        actions.handleChat(response);
    };

    return (
        <div>
            {React.Children.map(children, (child) => {
                return React.cloneElement(child, {
                    parse: parse,
                    actions,
                });
            })}
        </div>
    );
};

export default MessageParser;