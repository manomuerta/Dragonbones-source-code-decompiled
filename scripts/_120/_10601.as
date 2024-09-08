package _120
{
   public class _10601 extends _119
   {
      private var _10679:Function;
      
      public function _10601(param1:Function)
      {
         super();
         this._10679 = param1;
      }
      
      override public function run() : void
      {
         super.run();
         this._2222 = this._11540;
         if(this._10679 != null)
         {
            if(this._10679.length === 1)
            {
               this._10679(this);
            }
            else
            {
               this._10679();
            }
         }
         complete();
      }
   }
}

