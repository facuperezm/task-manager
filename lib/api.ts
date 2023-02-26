import { User } from "react-feather";
interface FetcherOptions {
  url: string;
  method: string;
  body?: any;
  json?: boolean;
}

const fetcher = async ({ url, method, body, json = true }: FetcherOptions) => {
  const res = await fetch(url, {
    method,
    body: json ? JSON.stringify(body) : body,
    headers: {
      "Content-Type": "application/json",
    },
  });
  if (!res.ok) {
    throw new Error(await res.text());
  }
  if (json) {
    const data = await res.json();
    return data;
  }
};

export const register = async (user: string) => {
  return fetcher({
    url: "/api/register",
    method: "POST",
    body: user,
    json: false, // false because we are sending a string
  });
};
export const signin = async (user: string) => {
  return fetcher({
    url: "/api/signin",
    method: "POST",
    body: user,
    json: false,
  });
};
