package com.codeazur.as3swf.data
{
   import _724._14088;
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.consts.BlendMode;
   import com.codeazur.as3swf.data.filters.IFilter;
   import com.codeazur.utils.StringUtils;
   
   public class SWFButtonRecord
   {
      public var hasBlendMode:Boolean = false;
      
      public var hasFilterList:Boolean = false;
      
      public var stateHitTest:Boolean;
      
      public var stateDown:Boolean;
      
      public var stateOver:Boolean;
      
      public var stateUp:Boolean;
      
      public var characterId:uint;
      
      public var placeDepth:uint;
      
      public var placeMatrix:SWFMatrix;
      
      public var colorTransform:SWFColorTransformWithAlpha;
      
      public var blendMode:uint;
      
      public var _15014:Boolean = false;
      
      protected var _filterList:Vector.<IFilter>;
      
      public var _15013:int;
      
      public function SWFButtonRecord(param1:SWFData = null, param2:uint = 1)
      {
         super();
         this._filterList = new Vector.<IFilter>();
         if(param1 != null)
         {
            this.parse(param1,param2);
         }
      }
      
      public function get filterList() : Vector.<IFilter>
      {
         return this._filterList;
      }
      
      public function parse(param1:SWFData, param2:uint = 1) : void
      {
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         this._15013 = param2;
         var _loc3_:uint = param1.readUI8();
         this.stateHitTest = (_loc3_ & 8) != 0;
         this.stateDown = (_loc3_ & 4) != 0;
         this.stateOver = (_loc3_ & 2) != 0;
         this.stateUp = (_loc3_ & 1) != 0;
         this.characterId = param1.readUI16();
         this.placeDepth = param1.readUI16();
         this.placeMatrix = param1.readMATRIX();
         if(param2 >= 2)
         {
            this.colorTransform = param1.readCXFORMWITHALPHA();
            this.hasFilterList = (_loc3_ & 0x10) != 0;
            if(this.hasFilterList)
            {
               _14088._14734 = true;
               _loc4_ = param1.readUI8();
               _loc5_ = 0;
               while(_loc5_ < _loc4_)
               {
                  this._filterList.push(param1.readFILTER());
                  _loc5_++;
               }
            }
            this.hasBlendMode = (_loc3_ & 0x20) != 0;
            if(this.hasBlendMode)
            {
               this.blendMode = param1.readUI8();
            }
         }
      }
      
      public function publish(param1:SWFData, param2:uint = 1) : void
      {
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         if(param2 >= 2 && this.hasBlendMode)
         {
            _loc3_ |= 32;
         }
         if(param2 >= 2 && this.hasFilterList)
         {
            _loc3_ |= 16;
         }
         if(this.stateHitTest)
         {
            _loc3_ |= 8;
         }
         if(this.stateDown)
         {
            _loc3_ |= 4;
         }
         if(this.stateOver)
         {
            _loc3_ |= 2;
         }
         if(this.stateUp)
         {
            _loc3_ |= 1;
         }
         param1.writeUI8(_loc3_);
         param1.writeUI16(this.characterId);
         param1.writeUI16(this.placeDepth);
         param1.writeMATRIX(this.placeMatrix);
         if(param2 >= 2)
         {
            param1.writeCXFORMWITHALPHA(this.colorTransform);
            if(this.hasFilterList)
            {
               _loc4_ = this.filterList.length;
               param1.writeUI8(_loc4_);
               _loc5_ = 0;
               while(_loc5_ < _loc4_)
               {
                  param1.writeFILTER(this.filterList[_loc5_]);
                  _loc5_++;
               }
            }
            if(this.hasBlendMode)
            {
               param1.writeUI8(this.blendMode);
            }
         }
      }
      
      public function clone() : SWFButtonRecord
      {
         var _loc1_:SWFButtonRecord = new SWFButtonRecord();
         _loc1_.hasBlendMode = this.hasBlendMode;
         _loc1_.hasFilterList = this.hasFilterList;
         _loc1_.stateHitTest = this.stateHitTest;
         _loc1_.stateDown = this.stateDown;
         _loc1_.stateOver = this.stateOver;
         _loc1_.stateUp = this.stateUp;
         _loc1_.characterId = this.characterId;
         _loc1_.placeDepth = this.placeDepth;
         _loc1_.placeMatrix = this.placeMatrix.clone();
         if(this.colorTransform)
         {
            _loc1_.colorTransform = this.colorTransform.clone() as SWFColorTransformWithAlpha;
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.filterList.length)
         {
            _loc1_.filterList.push(this.filterList[_loc2_].clone());
            _loc2_++;
         }
         _loc1_.blendMode = this.blendMode;
         return _loc1_;
      }
      
      public function toString(param1:uint = 0) : String
      {
         var _loc4_:uint = 0;
         var _loc2_:* = "Depth: " + this.placeDepth + ", CharacterID: " + this.characterId + ", States: ";
         var _loc3_:Array = [];
         if(this.stateUp)
         {
            _loc3_.push("up");
         }
         if(this.stateOver)
         {
            _loc3_.push("over");
         }
         if(this.stateDown)
         {
            _loc3_.push("down");
         }
         if(this.stateHitTest)
         {
            _loc3_.push("hit");
         }
         _loc2_ += _loc3_.join(",");
         if(this.hasBlendMode)
         {
            _loc2_ += ", BlendMode: " + BlendMode.toString(this.blendMode);
         }
         if(Boolean(this.placeMatrix) && !this.placeMatrix.isIdentity())
         {
            _loc2_ += "\n" + StringUtils.repeat(param1 + 2) + "Matrix: " + this.placeMatrix;
         }
         if(Boolean(this.colorTransform) && !this.colorTransform.isIdentity())
         {
            _loc2_ += "\n" + StringUtils.repeat(param1 + 2) + "ColorTransform: " + this.colorTransform;
         }
         if(this.hasFilterList)
         {
            _loc2_ += "\n" + StringUtils.repeat(param1 + 2) + "Filters:";
            _loc4_ = 0;
            while(_loc4_ < this.filterList.length)
            {
               _loc2_ += "\n" + StringUtils.repeat(param1 + 4) + "[" + _loc4_ + "] " + this.filterList[_loc4_].toString(param1 + 4);
               _loc4_++;
            }
         }
         return _loc2_;
      }
   }
}

