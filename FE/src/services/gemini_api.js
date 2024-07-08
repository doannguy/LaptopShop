import axios from 'axios';
import { GoogleGenerativeAI } from "@google/generative-ai";
import OpenAI from 'openai';

const genAI = new GoogleGenerativeAI("AIzaSyDK14TUePjNrJzHdn7qcbVwCbZZ4hoTXCk");
const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash" });

const openai = new OpenAI({
    apiKey: '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',
    dangerouslyAllowBrowser: true
});


export const postDataToGPT = async ({ messenger = {} }) => {
    const completion = await openai.chat.completions.create({
        messages: [{ role: "system", content: "Luôn trả lời bằng tiếng Việt, tôi tên là Đoàn, chỉ trả lời những câu hỏi về laptop" }, { role: "user", content: messenger },],
        model: "gpt-3.5-turbo-1106",
    });
    console.log(completion?.choices[0].message.content);
    return (completion?.choices[0].message.content);
}



// Tạo một yêu cầu POST với nội dung chat
export const postDataToGemini = async ({ messenger = {}, data = {} } = {}) => {
    const prompt = messenger;
    const result = await model.generateContent(prompt);
    const response = await result.response;
    const text = response.text();
    console.log(text);
    return text;
};