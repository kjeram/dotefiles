return {
  strategies = {
  -- Configures the default model for running custom prompts.
  cmd = {
    adapter = "ollama",
    model = "gpt-oss",
  },
    cmd = {
      adapter = "ollama",
      model = "llama3.1",
    },

    -- Configures the model for the interactive chat window (:CompanionChat).
    chat = {
      adapter = "ollama",
      model = "llama3.1",
    },

    -- Configures the model for any action that modifies code directly in your buffer
    -- using the 'inline' strategy.
    inline = {
      adapter = "ollama",
      model = "llama3.1",
    },
  },
}
