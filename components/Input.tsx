import clsx from "clsx";

const Input = ({ className, ...props }) => {
  return (
    <input
      className={clsx(
        "border-2 border-gray-300 rounded-lg px-4 py-2 w-full",
        className
      )}
      {...props}
    />
  );
};

export default Input;
