package _178
{
   public final class _181
   {
      public var name:String;
      
      public var parent:String;
      
      public var length:Number;
      
      public var global:_184;
      
      public var transform:_184;
      
      public var inheritScale:Boolean;
      
      public var inheritRotation:Boolean;
      
      public function _181()
      {
         super();
         this.length = 0;
         this.global = new _184();
         this.transform = new _184();
         this.inheritRotation = true;
         this.inheritScale = false;
      }
      
      public function dispose() : void
      {
         this.global = null;
         this.transform = null;
      }
   }
}

