'use client';
import { Provider } from "react-redux";
import { store } from "./store";
import { Next13ProgressBar } from 'next13-progressbar';

export function Providers({ children }) {
    return (
        <Provider store={store}>
            {children}
            <Next13ProgressBar height="4px" color="#0A2FFF" options={{ showSpinner: true }} showOnShallow />
        </Provider>
    );
}