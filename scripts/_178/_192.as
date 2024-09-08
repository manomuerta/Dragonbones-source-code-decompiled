package _178
{
   public final class _192
   {
      public var name:String;
      
      private var _2744:Vector.<_193>;
      
      public function _192()
      {
         super();
         this._2744 = new Vector.<_193>(0,true);
      }
      
      public function dispose() : void
      {
         var _loc1_:int = int(this._2744.length);
         while(_loc1_--)
         {
            this._2744[_loc1_].dispose();
         }
         this._2744.fixed = false;
         this._2744.length = 0;
         this._2744 = null;
      }
      
      public function _2748(param1:String) : _193
      {
         var _loc2_:int = int(this._2744.length);
         while(_loc2_--)
         {
            if(this._2744[_loc2_].name == param1)
            {
               return this._2744[_loc2_];
            }
         }
         return null;
      }
      
      public function _1792(param1:_193) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this._2744.indexOf(param1) < 0)
         {
            this._2744.fixed = false;
            this._2744[this._2744.length] = param1;
            this._2744.fixed = true;
            return;
         }
         throw new ArgumentError();
      }
      
      public function get _1780() : Vector.<_193>
      {
         return this._2744;
      }
   }
}

