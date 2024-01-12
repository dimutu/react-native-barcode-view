import {
  requireNativeComponent,
  UIManager,
  Platform,
  type ViewStyle,
} from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-barcode-view' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

type BarcodeViewProps = {
  style: ViewStyle;
  value: string;
};

const ComponentName = 'BarcodeViewView';

export const BarcodeViewView =
  UIManager.getViewManagerConfig(ComponentName) != null
    ? requireNativeComponent<BarcodeViewProps>(ComponentName)
    : () => {
        throw new Error(LINKING_ERROR);
      };
