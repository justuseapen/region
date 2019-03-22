import React from "react";
import CurrencyInput from 'react-currency-input';

class AddTransaction extends React.Component {
  constructor(props){
    super(props)
    this.state = {amount: "0.00"};
  }

  render(){
    return (
      <div>
        <h1>New Transaction</h1>
        <form>
          <input type="text" name="amount" />
          <CurrencyInput
            value={this.state.amount}
            onChangeEvent={this.handleChange}
            prefix="$"
          />
          <input type="text" name="name" />
          <input type="text" name="category" />
          <input type="text" name="type" />
          <button>Submit</button>
        </form>
      </div>
    )
  }
};

export default AddTransaction;
