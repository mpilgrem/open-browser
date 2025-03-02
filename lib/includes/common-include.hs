-- This file contains code that is common to module Web.Browser for different
-- operating systems.

-- | Seeks to open the given URL in the user's preferred web browser. Returns
-- whether or not the operation succeeded.
openBrowser ::
     String
     -- ^ URL
  -> IO Bool
