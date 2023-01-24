# Snålåk (vteams)

## Getting Started

Följ dessa steg för att komma igång med projektet:

Klona detta repository genom att köra git clone https://github.com/Jawnta/vteams.git i din terminal.

Navigera till projektmappen via terminalen och kör npm install för att installera alla beroenden.

Skapa en .env fil i packages/api mappen med följande innehåll:
GOOGLE_CLIENT_ID=[Ditt CLient_ID]
GOOGLE_CLIENT_SECRET=[Din client secret]

Skapa en .env fil i packages/clients/userMoblieClient mappen med följande innehåll:

API_URL=http://[Localhost ip]:8080

Ersätt [secret och ID] och [Localhost ip] med din egen information
När detta är klart kör docker-compose up -d för att starta projektet.

Om allt går bra, borde du nu kunna nå projektet genom att öppna webbläsaren och gå till http://localhost:3000/.

Kom ihåg att ha en fungerande version av Docker installerad på din dator för att kunna använda docker-compose kommandot.

För att stänga ner projektet, kör docker-compose down
