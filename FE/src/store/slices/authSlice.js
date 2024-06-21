import { createSlice } from "@reduxjs/toolkit";
import { UserLists } from "@/data/Users";

const authSlice = createSlice({
    name: 'auth',
    initialState: {
        login: false,
        userData: {},
    },
    reducers: {
        logIn(state, action) {
            state.login = true;
            state.userData = action.payload.userData;
        },
        logOut(state) {
            state.login = false;
            state.userData = {};
        }
    }
});

export const { logIn, logOut } = authSlice.actions;

export default authSlice.reducer;



