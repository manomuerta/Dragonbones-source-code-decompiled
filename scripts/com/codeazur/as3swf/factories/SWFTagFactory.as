package com.codeazur.as3swf.factories
{
   import com.codeazur.as3swf.tags.ITag;
   import com.codeazur.as3swf.tags.TagCSMTextSettings;
   import com.codeazur.as3swf.tags.TagDebugID;
   import com.codeazur.as3swf.tags.TagDefineBinaryData;
   import com.codeazur.as3swf.tags.TagDefineBits;
   import com.codeazur.as3swf.tags.TagDefineBitsJPEG2;
   import com.codeazur.as3swf.tags.TagDefineBitsJPEG3;
   import com.codeazur.as3swf.tags.TagDefineBitsJPEG4;
   import com.codeazur.as3swf.tags.TagDefineBitsLossless;
   import com.codeazur.as3swf.tags.TagDefineBitsLossless2;
   import com.codeazur.as3swf.tags.TagDefineButton;
   import com.codeazur.as3swf.tags.TagDefineButton2;
   import com.codeazur.as3swf.tags.TagDefineButtonCxform;
   import com.codeazur.as3swf.tags.TagDefineButtonSound;
   import com.codeazur.as3swf.tags.TagDefineEditText;
   import com.codeazur.as3swf.tags.TagDefineFont;
   import com.codeazur.as3swf.tags.TagDefineFont2;
   import com.codeazur.as3swf.tags.TagDefineFont3;
   import com.codeazur.as3swf.tags.TagDefineFont4;
   import com.codeazur.as3swf.tags.TagDefineFontAlignZones;
   import com.codeazur.as3swf.tags.TagDefineFontInfo;
   import com.codeazur.as3swf.tags.TagDefineFontInfo2;
   import com.codeazur.as3swf.tags.TagDefineFontName;
   import com.codeazur.as3swf.tags.TagDefineMorphShape;
   import com.codeazur.as3swf.tags.TagDefineMorphShape2;
   import com.codeazur.as3swf.tags.TagDefineScalingGrid;
   import com.codeazur.as3swf.tags.TagDefineSceneAndFrameLabelData;
   import com.codeazur.as3swf.tags.TagDefineShape;
   import com.codeazur.as3swf.tags.TagDefineShape2;
   import com.codeazur.as3swf.tags.TagDefineShape3;
   import com.codeazur.as3swf.tags.TagDefineShape4;
   import com.codeazur.as3swf.tags.TagDefineSound;
   import com.codeazur.as3swf.tags.TagDefineSprite;
   import com.codeazur.as3swf.tags.TagDefineText;
   import com.codeazur.as3swf.tags.TagDefineText2;
   import com.codeazur.as3swf.tags.TagDefineVideoStream;
   import com.codeazur.as3swf.tags.TagDoABC;
   import com.codeazur.as3swf.tags.TagDoABCDeprecated;
   import com.codeazur.as3swf.tags.TagDoAction;
   import com.codeazur.as3swf.tags.TagDoInitAction;
   import com.codeazur.as3swf.tags.TagEnableDebugger;
   import com.codeazur.as3swf.tags.TagEnableDebugger2;
   import com.codeazur.as3swf.tags.TagEnd;
   import com.codeazur.as3swf.tags.TagExportAssets;
   import com.codeazur.as3swf.tags.TagFileAttributes;
   import com.codeazur.as3swf.tags.TagFrameLabel;
   import com.codeazur.as3swf.tags.TagImportAssets;
   import com.codeazur.as3swf.tags.TagImportAssets2;
   import com.codeazur.as3swf.tags.TagJPEGTables;
   import com.codeazur.as3swf.tags.TagMetadata;
   import com.codeazur.as3swf.tags.TagPlaceObject;
   import com.codeazur.as3swf.tags.TagPlaceObject2;
   import com.codeazur.as3swf.tags.TagPlaceObject3;
   import com.codeazur.as3swf.tags.TagPlaceObject4;
   import com.codeazur.as3swf.tags.TagProductInfo;
   import com.codeazur.as3swf.tags.TagProtect;
   import com.codeazur.as3swf.tags.TagRemoveObject;
   import com.codeazur.as3swf.tags.TagRemoveObject2;
   import com.codeazur.as3swf.tags.TagScriptLimits;
   import com.codeazur.as3swf.tags.TagSetBackgroundColor;
   import com.codeazur.as3swf.tags.TagSetTabIndex;
   import com.codeazur.as3swf.tags.TagShowFrame;
   import com.codeazur.as3swf.tags.TagSoundStreamBlock;
   import com.codeazur.as3swf.tags.TagSoundStreamHead;
   import com.codeazur.as3swf.tags.TagSoundStreamHead2;
   import com.codeazur.as3swf.tags.TagStartSound;
   import com.codeazur.as3swf.tags.TagStartSound2;
   import com.codeazur.as3swf.tags.TagSymbolClass;
   import com.codeazur.as3swf.tags.TagUnknown;
   import com.codeazur.as3swf.tags.TagVideoFrame;
   import com.codeazur.as3swf.tags._14141;
   import com.codeazur.as3swf.tags._14142;
   import com.codeazur.as3swf.tags.etc.TagSWFEncryptActions;
   import com.codeazur.as3swf.tags.etc.TagSWFEncryptSignature;
   
   public class SWFTagFactory implements ISWFTagFactory
   {
      public function SWFTagFactory()
      {
         super();
      }
      
      public function create(param1:uint) : ITag
      {
         switch(param1)
         {
            case TagEnd.TYPE:
               return this.createTagEnd();
            case TagShowFrame.TYPE:
               return this.createTagShowFrame();
            case TagDefineShape.TYPE:
               return this.createTagDefineShape();
            case TagPlaceObject.TYPE:
               return this.createTagPlaceObject();
            case TagRemoveObject.TYPE:
               return this.createTagRemoveObject();
            case TagDefineBits.TYPE:
               return this.createTagDefineBits();
            case TagDefineButton.TYPE:
               return this.createTagDefineButton();
            case TagJPEGTables.TYPE:
               return this.createTagJPEGTables();
            case TagSetBackgroundColor.TYPE:
               return this.createTagSetBackgroundColor();
            case TagDefineFont.TYPE:
               return this.createTagDefineFont();
            case TagDefineText.TYPE:
               return this.createTagDefineText();
            case TagDoAction.TYPE:
               return this.createTagDoAction();
            case TagDefineFontInfo.TYPE:
               return this.createTagDefineFontInfo();
            case TagDefineSound.TYPE:
               return this.createTagDefineSound();
            case TagStartSound.TYPE:
               return this.createTagStartSound();
            case TagDefineButtonSound.TYPE:
               return this.createTagDefineButtonSound();
            case TagSoundStreamHead.TYPE:
               return this.createTagSoundStreamHead();
            case TagSoundStreamBlock.TYPE:
               return this.createTagSoundStreamBlock();
            case TagDefineBitsLossless.TYPE:
               return this.createTagDefineBitsLossless();
            case TagDefineBitsJPEG2.TYPE:
               return this.createTagDefineBitsJPEG2();
            case TagDefineShape2.TYPE:
               return this.createTagDefineShape2();
            case TagDefineButtonCxform.TYPE:
               return this.createTagDefineButtonCxform();
            case TagProtect.TYPE:
               return this.createTagProtect();
            case TagPlaceObject2.TYPE:
               return this.createTagPlaceObject2();
            case TagRemoveObject2.TYPE:
               return this.createTagRemoveObject2();
            case TagDefineShape3.TYPE:
               return this.createTagDefineShape3();
            case TagDefineText2.TYPE:
               return this.createTagDefineText2();
            case TagDefineButton2.TYPE:
               return this.createTagDefineButton2();
            case TagDefineBitsJPEG3.TYPE:
               return this.createTagDefineBitsJPEG3();
            case TagDefineBitsLossless2.TYPE:
               return this.createTagDefineBitsLossless2();
            case TagDefineEditText.TYPE:
               return this.createTagDefineEditText();
            case TagDefineSprite.TYPE:
               return this.createTagDefineSprite();
            case _14142.TYPE:
               return this._15057();
            case TagProductInfo.TYPE:
               return this.createTagProductInfo();
            case TagFrameLabel.TYPE:
               return this.createTagFrameLabel();
            case TagSoundStreamHead2.TYPE:
               return this.createTagSoundStreamHead2();
            case TagDefineMorphShape.TYPE:
               return this.createTagDefineMorphShape();
            case TagDefineFont2.TYPE:
               return this.createTagDefineFont2();
            case TagExportAssets.TYPE:
               return this.createTagExportAssets();
            case TagImportAssets.TYPE:
               return this.createTagImportAssets();
            case TagEnableDebugger.TYPE:
               return this.createTagEnableDebugger();
            case TagDoInitAction.TYPE:
               return this.createTagDoInitAction();
            case TagDefineVideoStream.TYPE:
               return this.createTagDefineVideoStream();
            case TagVideoFrame.TYPE:
               return this.createTagVideoFrame();
            case TagDefineFontInfo2.TYPE:
               return this.createTagDefineFontInfo2();
            case TagDebugID.TYPE:
               return this.createTagDebugID();
            case TagEnableDebugger2.TYPE:
               return this.createTagEnableDebugger2();
            case TagScriptLimits.TYPE:
               return this.createTagScriptLimits();
            case TagSetTabIndex.TYPE:
               return this.createTagSetTabIndex();
            case TagFileAttributes.TYPE:
               return this.createTagFileAttributes();
            case TagPlaceObject3.TYPE:
               return this.createTagPlaceObject3();
            case TagImportAssets2.TYPE:
               return this.createTagImportAssets2();
            case TagDoABCDeprecated.TYPE:
               return this.createTagDoABCDeprecated();
            case TagDefineFontAlignZones.TYPE:
               return this.createTagDefineFontAlignZones();
            case TagCSMTextSettings.TYPE:
               return this.createTagCSMTextSettings();
            case TagDefineFont3.TYPE:
               return this.createTagDefineFont3();
            case TagSymbolClass.TYPE:
               return this.createTagSymbolClass();
            case TagMetadata.TYPE:
               return this.createTagMetadata();
            case TagDefineScalingGrid.TYPE:
               return this.createTagDefineScalingGrid();
            case TagDoABC.TYPE:
               return this.createTagDoABC();
            case TagDefineShape4.TYPE:
               return this.createTagDefineShape4();
            case TagDefineMorphShape2.TYPE:
               return this.createTagDefineMorphShape2();
            case TagDefineSceneAndFrameLabelData.TYPE:
               return this.createTagDefineSceneAndFrameLabelData();
            case TagDefineBinaryData.TYPE:
               return this.createTagDefineBinaryData();
            case TagDefineFontName.TYPE:
               return this.createTagDefineFontName();
            case TagStartSound2.TYPE:
               return this.createTagStartSound2();
            case TagDefineBitsJPEG4.TYPE:
               return this.createTagDefineBitsJPEG4();
            case TagDefineFont4.TYPE:
               return this.createTagDefineFont4();
            case _14141.TYPE:
               return this._15056();
            case TagPlaceObject4.TYPE:
               return this.createTagPlaceObject4();
            case TagSWFEncryptActions.TYPE:
               return this.createTagSWFEncryptActions();
            case TagSWFEncryptSignature.TYPE:
               return this.createTagSWFEncryptSignature();
            default:
               return this.createTagUnknown(param1);
         }
      }
      
      protected function createTagEnd() : ITag
      {
         return new TagEnd();
      }
      
      protected function createTagShowFrame() : ITag
      {
         return new TagShowFrame();
      }
      
      protected function createTagDefineShape() : ITag
      {
         return new TagDefineShape();
      }
      
      protected function createTagPlaceObject() : ITag
      {
         return new TagPlaceObject();
      }
      
      protected function createTagRemoveObject() : ITag
      {
         return new TagRemoveObject();
      }
      
      protected function createTagDefineBits() : ITag
      {
         return new TagDefineBits();
      }
      
      protected function createTagDefineButton() : ITag
      {
         return new TagDefineButton();
      }
      
      protected function createTagJPEGTables() : ITag
      {
         return new TagJPEGTables();
      }
      
      protected function createTagSetBackgroundColor() : ITag
      {
         return new TagSetBackgroundColor();
      }
      
      protected function createTagDefineFont() : ITag
      {
         return new TagDefineFont();
      }
      
      protected function createTagDefineText() : ITag
      {
         return new TagDefineText();
      }
      
      protected function createTagDoAction() : ITag
      {
         return new TagDoAction();
      }
      
      protected function createTagDefineFontInfo() : ITag
      {
         return new TagDefineFontInfo();
      }
      
      protected function createTagDefineSound() : ITag
      {
         return new TagDefineSound();
      }
      
      protected function createTagStartSound() : ITag
      {
         return new TagStartSound();
      }
      
      protected function createTagDefineButtonSound() : ITag
      {
         return new TagDefineButtonSound();
      }
      
      protected function createTagSoundStreamHead() : ITag
      {
         return new TagSoundStreamHead();
      }
      
      protected function createTagSoundStreamBlock() : ITag
      {
         return new TagSoundStreamBlock();
      }
      
      protected function createTagDefineBitsLossless() : ITag
      {
         return new TagDefineBitsLossless();
      }
      
      protected function createTagDefineBitsJPEG2() : ITag
      {
         return new TagDefineBitsJPEG2();
      }
      
      protected function createTagDefineShape2() : ITag
      {
         return new TagDefineShape2();
      }
      
      protected function createTagDefineButtonCxform() : ITag
      {
         return new TagDefineButtonCxform();
      }
      
      protected function createTagProtect() : ITag
      {
         return new TagProtect();
      }
      
      protected function createTagPlaceObject2() : ITag
      {
         return new TagPlaceObject2();
      }
      
      protected function createTagRemoveObject2() : ITag
      {
         return new TagRemoveObject2();
      }
      
      protected function createTagDefineShape3() : ITag
      {
         return new TagDefineShape3();
      }
      
      protected function createTagDefineText2() : ITag
      {
         return new TagDefineText2();
      }
      
      protected function createTagDefineButton2() : ITag
      {
         return new TagDefineButton2();
      }
      
      protected function createTagDefineBitsJPEG3() : ITag
      {
         return new TagDefineBitsJPEG3();
      }
      
      protected function createTagDefineBitsLossless2() : ITag
      {
         return new TagDefineBitsLossless2();
      }
      
      protected function createTagDefineEditText() : ITag
      {
         return new TagDefineEditText();
      }
      
      protected function createTagDefineSprite() : ITag
      {
         return new TagDefineSprite();
      }
      
      protected function _15057() : ITag
      {
         return new _14142();
      }
      
      protected function createTagProductInfo() : ITag
      {
         return new TagProductInfo();
      }
      
      protected function createTagFrameLabel() : ITag
      {
         return new TagFrameLabel();
      }
      
      protected function createTagSoundStreamHead2() : ITag
      {
         return new TagSoundStreamHead2();
      }
      
      protected function createTagDefineMorphShape() : ITag
      {
         return new TagDefineMorphShape();
      }
      
      protected function createTagDefineFont2() : ITag
      {
         return new TagDefineFont2();
      }
      
      protected function createTagExportAssets() : ITag
      {
         return new TagExportAssets();
      }
      
      protected function createTagImportAssets() : ITag
      {
         return new TagImportAssets();
      }
      
      protected function createTagEnableDebugger() : ITag
      {
         return new TagEnableDebugger();
      }
      
      protected function createTagDoInitAction() : ITag
      {
         return new TagDoInitAction();
      }
      
      protected function createTagDefineVideoStream() : ITag
      {
         return new TagDefineVideoStream();
      }
      
      protected function createTagVideoFrame() : ITag
      {
         return new TagVideoFrame();
      }
      
      protected function createTagDefineFontInfo2() : ITag
      {
         return new TagDefineFontInfo2();
      }
      
      protected function createTagDebugID() : ITag
      {
         return new TagDebugID();
      }
      
      protected function createTagEnableDebugger2() : ITag
      {
         return new TagEnableDebugger2();
      }
      
      protected function createTagScriptLimits() : ITag
      {
         return new TagScriptLimits();
      }
      
      protected function createTagSetTabIndex() : ITag
      {
         return new TagSetTabIndex();
      }
      
      protected function createTagFileAttributes() : ITag
      {
         return new TagFileAttributes();
      }
      
      protected function createTagPlaceObject3() : ITag
      {
         return new TagPlaceObject3();
      }
      
      protected function createTagImportAssets2() : ITag
      {
         return new TagImportAssets2();
      }
      
      protected function createTagDefineFontAlignZones() : ITag
      {
         return new TagDefineFontAlignZones();
      }
      
      protected function createTagCSMTextSettings() : ITag
      {
         return new TagCSMTextSettings();
      }
      
      protected function createTagDefineFont3() : ITag
      {
         return new TagDefineFont3();
      }
      
      protected function createTagSymbolClass() : ITag
      {
         return new TagSymbolClass();
      }
      
      protected function createTagMetadata() : ITag
      {
         return new TagMetadata();
      }
      
      protected function createTagDefineScalingGrid() : ITag
      {
         return new TagDefineScalingGrid();
      }
      
      protected function createTagDoABC() : ITag
      {
         return new TagDoABC();
      }
      
      protected function createTagDoABCDeprecated() : ITag
      {
         return new TagDoABCDeprecated();
      }
      
      protected function createTagDefineShape4() : ITag
      {
         return new TagDefineShape4();
      }
      
      protected function createTagDefineMorphShape2() : ITag
      {
         return new TagDefineMorphShape2();
      }
      
      protected function createTagDefineSceneAndFrameLabelData() : ITag
      {
         return new TagDefineSceneAndFrameLabelData();
      }
      
      protected function createTagDefineBinaryData() : ITag
      {
         return new TagDefineBinaryData();
      }
      
      protected function createTagDefineFontName() : ITag
      {
         return new TagDefineFontName();
      }
      
      protected function createTagStartSound2() : ITag
      {
         return new TagStartSound2();
      }
      
      protected function createTagDefineBitsJPEG4() : ITag
      {
         return new TagDefineBitsJPEG4();
      }
      
      protected function createTagDefineFont4() : ITag
      {
         return new TagDefineFont4();
      }
      
      protected function _15056() : ITag
      {
         return new _14141();
      }
      
      protected function createTagPlaceObject4() : ITag
      {
         return new TagPlaceObject4();
      }
      
      protected function createTagSWFEncryptActions() : ITag
      {
         return new TagSWFEncryptActions();
      }
      
      protected function createTagSWFEncryptSignature() : ITag
      {
         return new TagSWFEncryptSignature();
      }
      
      protected function createTagUnknown(param1:uint) : ITag
      {
         return new TagUnknown(param1);
      }
   }
}

