import { moves } from "./data.js";
import PokeMoveCard from "./PokeMoveCard.js";

const PokeMoves = () => {
  return (
    <div>
      <h1>PokeMoves</h1>
      <ul>
        {moves.map((moveInfo) => (
          // <li key={move.id}>
          //   {move.id}. {move.move}
          // </li>
          <PokeMoveCard key={moveInfo.id} {...moveInfo} />
        ))}
      </ul>
    </div>
  );
};

export default PokeMoves;
