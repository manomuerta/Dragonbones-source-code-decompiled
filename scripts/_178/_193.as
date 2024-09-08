package _178
{
   public final class _193
   {
      public var name:String;
      
      public var parent:String;
      
      public var zOrder:Number;
      
      public var blendMode:String;
      
      public var displayIndex:int;
      
      private var _2768:Vector.<_186>;
      
      public function _193()
      {
         super();
         this._2768 = new Vector.<_186>(0,true);
         this.zOrder = 0;
      }
      
      public function dispose() : void
      {
         this._2768.fixed = false;
         this._2768.length = 0;
      }
      
      public function _1766(param1:_186) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this._2768.indexOf(param1) < 0)
         {
            this._2768.fixed = false;
            this._2768[this._2768.length] = param1;
            this._2768.fixed = true;
            return;
         }
         throw new ArgumentError();
      }
      
      public function _2769(param1:String) : _186
      {
         var _loc2_:int = int(this._2768.length);
         while(_loc2_--)
         {
            if(this._2768[_loc2_].name == param1)
            {
               return this._2768[_loc2_];
            }
         }
         return null;
      }
      
      public function get _1752() : Vector.<_186>
      {
         return this._2768;
      }
   }
}

