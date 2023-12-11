activate_this = "~/dev/scripts/venv/bin/activate_this.py"
with open(activate_this) as file_:
    exec(file_.read(), dict(__file__=activate_this))

import keyboard
import pyperclip

def main():
    texto = ""

    while True:
        evento = keyboard.read_event()

        if evento.event_type == keyboard.KEY_DOWN:
            if evento.name in "aeiouAEIOU":
                texto += evento.name
            elif evento.name == "space" and texto and texto[-1] in "aeiouAEIOU":
                vocal_con_tilde = texto[-1] + "́"
                texto = texto[:-1] + vocal_con_tilde
            elif evento.name == "space":
                texto += " "
            else:
                texto += evento.name

        pyperclip.copy(texto)

if __name__ == "__main__":
    main()
