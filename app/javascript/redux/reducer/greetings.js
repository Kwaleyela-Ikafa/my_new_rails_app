import axios from "axios"

const FETCH_GREETINGS = 'FETCH_GREETINGS'
const API_URL = 'http://127.0.0.1:3000/api/v1/greetings/random'

export const getGreetings = (payload) => ({
  type: FETCH_GREETINGS,
  payload,
})


const initialState = {
    greeting: []
}

export const fetchGreetingsFromApi = () => (dispatch) => {

  axios.get(API_URL).then((response) => {
    const greeting = response.data;
    dispatch(getGreetings(greeting));
  }).catch(e => {
    console.log(e);
  });
  };

const greetingReducer = (state = initialState, action) => {
  switch (action.type) {
    case FETCH_GREETINGS:
      return action.payload;
    default:
      return state;
  }
};

export default greetingReducer