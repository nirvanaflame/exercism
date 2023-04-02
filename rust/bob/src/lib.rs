pub fn reply(message: &str) -> &str {
    let message = message.trim();

    if message.is_empty() {
        return "Fine. Be that way!";
    }

    let is_question = message.ends_with("?");
    let is_shout = message.contains(|x: char| x.is_alphabetic()) && message == message.to_uppercase();

    return match (is_question, is_shout) {
        (true, true) => "Calm down, I know what I'm doing!",
        (_, true) => "Whoa, chill out!",
        (true, _) => "Sure.",
        _ => "Whatever.",
    };
}
