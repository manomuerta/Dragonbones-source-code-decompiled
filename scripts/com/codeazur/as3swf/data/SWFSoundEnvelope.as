package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   
   public class SWFSoundEnvelope
   {
      public var pos44:uint;
      
      public var leftLevel:uint;
      
      public var rightLevel:uint;
      
      public function SWFSoundEnvelope(param1:SWFData = null)
      {
         super();
         if(param1 != null)
         {
            this.parse(param1);
         }
      }
      
      public function parse(param1:SWFData) : void
      {
         this.pos44 = param1.readUI32();
         this.leftLevel = param1.readUI16();
         this.rightLevel = param1.readUI16();
      }
      
      public function publish(param1:SWFData) : void
      {
         param1.writeUI32(this.pos44);
         param1.writeUI16(this.leftLevel);
         param1.writeUI16(this.rightLevel);
      }
      
      public function clone() : SWFSoundEnvelope
      {
         var _loc1_:SWFSoundEnvelope = new SWFSoundEnvelope();
         _loc1_.pos44 = this.pos44;
         _loc1_.leftLevel = this.leftLevel;
         _loc1_.rightLevel = this.rightLevel;
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "[SWFSoundEnvelope]";
      }
   }
}

