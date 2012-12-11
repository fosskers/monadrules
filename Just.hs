-- Proving that Just is a Monad.

import MonadRules

allProofs :: Bool
allProofs = and [ proof1
                , proof2 (Just 1)
                , proof2 Nothing
                , proof3 (Just 1)
                , proof3 (Nothing :: Maybe Int) ]  -- Needs to be concrete.
                                                   -- Int could be anything.

proof1 :: Bool
proof1 = rule1 1 Just

proof2 :: Maybe Int -> Bool
proof2 = rule2

proof3 :: Eq c => Maybe c -> Bool
proof3 m = rule3 m Just Just
