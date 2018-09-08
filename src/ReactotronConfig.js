import Reactotron from 'reactotron-react-js'
import { reactotronRedux } from 'reactotron-redux'

const reactotron = Reactotron
  .configure({ name: 'Wayback' }) // we can use plugins here -- more on this later
  .use(reactotronRedux()) //  <- here i am!
  .connect() // let's connect!

export default reactotron
