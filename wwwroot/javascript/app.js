/**
 *
 * @param {*} contentType
 * @returns
 */
const isDevelopment = true;

/**
 * 取得 UrlParams
 * @param {*} key
 * @returns
 */
function getUrlParam(key) {
  const queryString = window.location.search;
  const urlParams = new URLSearchParams(queryString);
  return urlParams.get(key);
}

function showModal(element) {
  let modal = new bootstrap.Modal(element);
  modal.show();
}

/**
 * 開啟 Modal
 * @param {*} id
 * @returns
 */
function bsModal(id) {
  const modal = document.getElementById(id);
  return new bootstrap.Modal(modal);
}

const getHeader = function (contentType = "application/json") {
  const token = localStorage.getItem("token");
  let options = {
    "Content-Type": contentType,
  };
  // JWT 驗證
  if (token !== null) {
    options.Authorization = `Bearer ${token}`;
  }
  return options;
};

function getUrlQuery(params, num = true) {
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
/**
 * 取得 api url
 * @returns
 */
const getAPIUrl = function () {
  if (isDevelopment == true) {
    return "http://localhost:7197";
  }
  return "http://demo.sunyu-tech.com.tw/Audio";
};

/**
 * 呼叫 get api token
 * @param {*} uri
 * @returns
 */
function fetchGet(uri) {
  // middle url
  return new Promise((resolve, reject) => {
    const url = getAPIUrl();
    console.log(`${url}${uri}`)
    fetch(`${url}${uri}`, {
      method: "GET",
      headers: getHeader(),
    })
      .then((res) => {
        resolve(res.json());
      })
      .catch((e) => {
        reject(e);
      });
  });
}

/**
 *
 * @param {*} uri
 * @param {*} data
 * @returns
 */
function fetchPost(uri, data) {
  // middle url
  return new Promise((resolve, reject) => {
    let url = getAPIUrl();
    fetch(`${url}${uri}`, {
      method: "POST",
      body: JSON.stringify(data),
      headers: getHeader(),
    })
      .then((res) => {
        resolve(res.json());
      })
      .catch((e) => {
        reject(e);
      });
  });
}
/**
 *
 * @param {*} uri
 * @param {*} data
 * @returns
 */
function fetchPut(uri, data) {
  // middle url
  return new Promise((resolve, reject) => {
    let url = getAPIUrl();
    fetch(`${url}${uri}`, {
      method: "POST",
      body: JSON.stringify(data),
      headers: getHeader(),
    })
      .then((res) => {
        resolve(res.json());
      })
      .catch((e) => {
        reject(e);
      });
  });
}
/**
 *
 * @param {*} data
 */
function setUserInfo(data) {
  var value = JSON.stringify(data);
  localStorage.setItem("token", data.token);
  localStorage.setItem("userInfo", value);
}
/**
 *
 * @returns
 */
function getUserInfo() {
  var value = localStorage.getItem("userInfo");
  return JSON.parse(value);
}
/**
 *
 */
function clearAll() {
  localStorage.clear();
}
/**
 *
 * @returns
 */
function getToken() {
  return localStorage.getItem("token");
}
