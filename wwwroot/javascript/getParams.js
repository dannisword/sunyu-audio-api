export function getParams(params, num = true) {
  let query = "";
  for (let [key, value] of Object.entries(params)) {
    if (typeof value == "number" && value == 0) {
      continue;
    }
    if (typeof value == "string" && value == "") {
      continue;
    }
    if (query == "") {
      query += `?${key}=${value}`;
    } else {
      query += `&${key}=${value}`;
    }
  }
  return query;
}
