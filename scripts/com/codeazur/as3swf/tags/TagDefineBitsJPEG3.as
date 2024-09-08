package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.consts.BitmapType;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   
   public class TagDefineBitsJPEG3 extends TagDefineBitsJPEG2 implements IDefinitionTag
   {
      public static const TYPE:uint = 35;
      
      protected var _bitmapAlphaData:ByteArray;
      
      public function TagDefineBitsJPEG3()
      {
         super();
         this._bitmapAlphaData = new ByteArray();
      }
      
      public function get bitmapAlphaData() : ByteArray
      {
         return this._bitmapAlphaData;
      }
      
      override public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         _characterId = param1.readUI16();
         var _loc5_:uint = param1.readUI32();
         param1.readBytes(_bitmapData,0,_loc5_);
         if(bitmapData[0] == 255 && (bitmapData[1] == 216 || bitmapData[1] == 217))
         {
            bitmapType = BitmapType.JPEG;
         }
         else if(bitmapData[0] == 137 && bitmapData[1] == 80 && bitmapData[2] == 78 && bitmapData[3] == 71 && bitmapData[4] == 13 && bitmapData[5] == 10 && bitmapData[6] == 26 && bitmapData[7] == 10)
         {
            bitmapType = BitmapType.PNG;
         }
         else if(bitmapData[0] == 71 && bitmapData[1] == 73 && bitmapData[2] == 70 && bitmapData[3] == 56 && bitmapData[4] == 57 && bitmapData[5] == 97)
         {
            bitmapType = BitmapType.GIF89A;
         }
         var _loc6_:uint = uint(param2 - _loc5_ - 6);
         if(_loc6_ > 0)
         {
            param1.readBytes(this._bitmapAlphaData,0,_loc6_);
         }
      }
      
      override public function publish(param1:SWFData, param2:uint) : void
      {
         param1.writeTagHeader(this.type,_bitmapData.length + this._bitmapAlphaData.length + 6,true);
         param1.writeUI16(characterId);
         param1.writeUI32(_bitmapData.length);
         if(_bitmapData.length > 0)
         {
            param1.writeBytes(_bitmapData);
         }
         if(this._bitmapAlphaData.length > 0)
         {
            param1.writeBytes(this._bitmapAlphaData);
         }
      }
      
      override protected function exportCompleteHandler(param1:Event) : void
      {
         var _loc4_:ByteArray = null;
         var _loc5_:int = 0;
         var _loc6_:Rectangle = null;
         var _loc7_:ByteArray = null;
         var _loc8_:ByteArray = null;
         var _loc9_:int = 0;
         var _loc10_:uint = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc2_:Loader = param1.target.loader as Loader;
         var _loc3_:BitmapData = new BitmapData(_loc2_.content.width,_loc2_.content.height);
         _loc3_.draw(_loc2_);
         if(this._bitmapAlphaData.length > 0)
         {
            _loc4_ = new ByteArray();
            this._bitmapAlphaData.position = 0;
            this._bitmapAlphaData.readBytes(_loc4_);
            _loc4_.uncompress();
            _loc5_ = _loc3_.width * _loc3_.height;
            _loc6_ = new Rectangle(0,0,_loc3_.width,_loc3_.height);
            (_loc7_ = new ByteArray()).length = _loc5_ * 4;
            (_loc8_ = _loc3_.getPixels(_loc6_)).position = 0;
            _loc9_ = 0;
            while(_loc9_ < _loc5_)
            {
               _loc10_ = uint(_loc8_.readUnsignedInt() & 0xFFFFFF);
               _loc11_ = int(_loc4_[_loc9_]);
               if(_loc11_ == 0)
               {
                  _loc10_ = 0;
               }
               else if(_loc11_ == 255)
               {
                  _loc10_ |= 4278190080;
               }
               else
               {
                  _loc12_ = (_loc10_ >> 16) * 255 / _loc11_;
                  if(_loc12_ > 255)
                  {
                     _loc12_ = 255;
                  }
                  _loc13_ = (_loc10_ >> 8 & 0xFF) * 255 / _loc11_;
                  if(_loc13_ > 255)
                  {
                     _loc13_ = 255;
                  }
                  _loc14_ = (_loc10_ & 0xFF) * 255 / _loc11_;
                  if(_loc14_ > 255)
                  {
                     _loc14_ = 255;
                  }
                  _loc10_ = uint(_loc11_ << 24 | _loc12_ << 16 | _loc13_ << 8 | _loc14_);
               }
               _loc7_.writeUnsignedInt(_loc10_);
               _loc9_++;
            }
            _loc7_.position = 0;
            _loc3_.setPixels(_loc6_,_loc7_);
         }
         onCompleteCallback(_loc3_,this);
      }
      
      override public function clone() : IDefinitionTag
      {
         var _loc1_:TagDefineBitsJPEG3 = new TagDefineBitsJPEG3();
         _loc1_.characterId = characterId;
         _loc1_.bitmapType = bitmapType;
         if(_bitmapData.length > 0)
         {
            _loc1_.bitmapData.writeBytes(_bitmapData);
         }
         if(this._bitmapAlphaData.length > 0)
         {
            _loc1_.bitmapAlphaData.writeBytes(this._bitmapAlphaData);
         }
         return _loc1_;
      }
      
      override public function get type() : uint
      {
         return TYPE;
      }
      
      override public function get name() : String
      {
         return "DefineBitsJPEG3";
      }
      
      override public function get version() : uint
      {
         return bitmapType == BitmapType.JPEG ? 3 : 8;
      }
      
      override public function get level() : uint
      {
         return 3;
      }
      
      override public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         return Tag.toStringCommon(this.type,this.name,param1) + "ID: " + characterId + ", " + "Type: " + BitmapType.toString(bitmapType) + ", " + "HasAlphaData: " + (this._bitmapAlphaData.length > 0) + ", " + (this._bitmapAlphaData.length > 0 ? "BitmapAlphaLength: " + this._bitmapAlphaData.length + ", " : "") + "BitmapLength: " + bitmapData.length;
      }
   }
}

