
function getCookie(cookieName: string) {
    let name = cookieName + "=";
    let split = document.cookie.split(';');
    for(let j = 0; j < split.length; j++) {
      let char = split[j];
      while (char.charAt(0) === ' ') {
        char = char.substring(1);
      }
      if (char.indexOf(name) === 0) {
        return char.substring(name.length, char.length);
      }
    }
    return "";
  }

  export default getCookie;

export const deleteCookie = () => {
    document.cookie = "id_token=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
};