# Snålåk (vteams)

## Getting Started

### Följ dessa steg för att komma igång med projektet:

1. Klona detta repository genom att köra git clone https://github.com/Jawnta/vteams.git i din terminal.

2. Navigera till projektmappen via terminalen och kör npm install för att installera alla beroenden.

3. Skapa en .env fil i packages/api mappen med följande innehåll:  
- ```GOOGLE_CLIENT_SECRET=""```  
- ```GOOGLE_CLIENT_ID=""```

4. Skapa en .env fil i packages/clients/userMoblieClient mappen med följande innehåll:

- ```API_URL=http://[Localhost ip]:8080```

5. Ersätt ```[secret och ID]``` och ```[Localhost ip]``` med din egen information
6. Kör docker-compose up -d för att starta projektet.
  
Kom ihåg att ha en fungerande version av Docker installerad på din dator för att kunna använda docker-compose kommandot.

För att stänga ner projektet, kör docker-compose down.
