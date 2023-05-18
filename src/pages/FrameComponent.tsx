import { FunctionComponent } from "react";
import styles from "./FrameComponent.module.css";
const FrameComponent: FunctionComponent = () => {
  return <iframe className={styles.frameIframe} />;
};

export default FrameComponent;
