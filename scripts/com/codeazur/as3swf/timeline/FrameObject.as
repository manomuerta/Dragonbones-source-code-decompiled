package com.codeazur.as3swf.timeline
{
   import com.codeazur.as3swf.tags.TagPlaceObject;
   import com.codeazur.utils.StringUtils;
   
   public class FrameObject
   {
      public var depth:uint;
      
      public var characterId:uint;
      
      public var className:String;
      
      public var placedAtIndex:uint;
      
      public var lastModifiedAtIndex:uint;
      
      public var isKeyframe:Boolean;
      
      public var layer:int = -1;
      
      public var _14730:TagPlaceObject;
      
      public function FrameObject(param1:uint, param2:uint, param3:String, param4:uint, param5:uint = 0, param6:Boolean = false)
      {
         super();
         this.depth = param1;
         this.characterId = param2;
         this.className = param3;
         this.placedAtIndex = param4;
         this.lastModifiedAtIndex = param5;
         this.isKeyframe = param6;
         this.layer = -1;
      }
      
      public function clone() : FrameObject
      {
         var _loc1_:FrameObject = new FrameObject(this.depth,this.characterId,this.className,this.placedAtIndex,this.lastModifiedAtIndex,false);
         _loc1_._14730 = this._14730;
         return _loc1_;
      }
      
      public function toString(param1:uint = 0) : String
      {
         var _loc2_:* = "\n" + StringUtils.repeat(param1 + 2) + "Depth: " + this.depth + (this.layer > -1 ? " (Layer " + this.layer + ")" : "") + ", " + "CharacterId: " + this.characterId + ", ";
         if(this.className != null)
         {
            _loc2_ += "ClassName: " + this.className + ", ";
         }
         _loc2_ += "PlacedAt: " + this.placedAtIndex;
         if(this.lastModifiedAtIndex)
         {
            _loc2_ += ", LastModifiedAt: " + this.lastModifiedAtIndex;
         }
         if(this.isKeyframe)
         {
            _loc2_ += ", IsKeyframe";
         }
         return _loc2_;
      }
   }
}

