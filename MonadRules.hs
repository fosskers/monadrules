-- Test those Monads!

module MonadRules
    ( rule1
    , rule2
    , rule3 ) where

-- Left identity.
rule1 :: (Eq (m b), Monad m) => a -> (a -> m b) -> Bool
rule1 a k = (return a >>= k) == (k a)

-- Right identity.
rule2 :: (Eq (m b), Monad m) => m b -> Bool
rule2 m = (m >>= return) == m

-- Associativity.
rule3 :: (Eq (m c), Monad m) => m a -> (a -> m b) -> (b -> m c) -> Bool
rule3 m k h = (m >>= (\x -> k x >>= h)) == ((m >>= k) >>= h)
