import { useState } from "react"

const useLocalStorage = (key, initialValue) => {
    const [state, setState] = useState(() => {
        // Initialize the state
        try {
            const value = window.localStorage.getItem(key)
            // Check if the local storage already has any values,
            // otherwise initialize it with the passed initialValue
            return value ? value : initialValue
        } catch (error) {
            console.log(error)
        }
    })

    const setValue = value => {
        try {
            // If the passed value is a callback function,
            //  then call it with the existing state.
            const valueToStore = value instanceof Function ? value(state) : value
            window.localStorage.setItem(key, JSON.stringify(valueToStore))
            setState(value)
        } catch (error) {
            console.log(error)
        }
    }
    const removeValue = () => {
        try {
            setState(initialValue);
            if (typeof window !== 'undefined') {
                window.localStorage.removeItem(key);
            }
        } catch (error) {
            console.error(error);
        }
    };

    return [state, setValue, removeValue]
}

export default useLocalStorage